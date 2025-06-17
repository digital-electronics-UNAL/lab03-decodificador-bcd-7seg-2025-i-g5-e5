module sensor_ultrasonico (
    input clk,              // reloj de 50 MHz
    input rst,              // reset síncrono
    input echo,             // pin ECHO del sensor
    output reg trigger,     // pin TRIGGER del sensor
    output reg [15:0] distancia_cm // resultado en cm (aproximado)
);

    // Parámetros
    parameter CLK_FREQ = 50000000; // 50 MHz
    parameter TRIG_PULSE_CYCLES = 500; // 10us de trigger (50MHz → 500 ciclos)

    // Estados como parámetros
    parameter IDLE = 3'd0;
    parameter TRIGGER_PULSE = 3'd1;
    parameter WAIT_ECHO_HIGH = 3'd2;
    parameter MEASURING = 3'd3;
    parameter DONE = 3'd4;

    reg [2:0] state, next_state;

    // Contadores
    reg [31:0] counter;
    reg [31:0] timer;
    reg [31:0] distancia_temp;

    // FSM de control
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            counter <= 0;
            timer <= 0;
            trigger <= 0;
            distancia_cm <= 0;
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    trigger <= 0;
                    counter <= 0;
                    timer <= 0;
                    $display("Estado: IDLE @ %0t", $time);
                end

                TRIGGER_PULSE: begin
                    trigger <= 1;
                    counter <= counter + 1;
                    $display("Estado: TRIGGER_PULSE, contador = %0d @ %0t", counter, $time);
                end

                WAIT_ECHO_HIGH: begin
                    trigger <= 0;
                    $display("Estado: WAIT_ECHO_HIGH @ %0t", $time);
                end

                MEASURING: begin
                    if (echo)
                        timer <= timer + 1;
                    $display("Estado: MEASURING, timer = %0d @ %0t", timer, $time);
                end

                DONE: begin
                    distancia_temp = (timer * 17150) / (CLK_FREQ / 1000000); // escala corregida
                    distancia_cm <= distancia_temp[15:0];
                    $display("Estado: DONE, distancia medida = %0d cm @ %0t", distancia_cm, $time);
                end
            endcase
        end
    end

    // Lógica de transición de estados
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                next_state = TRIGGER_PULSE;

            TRIGGER_PULSE:
                if (counter >= TRIG_PULSE_CYCLES)
                    next_state = WAIT_ECHO_HIGH;

            WAIT_ECHO_HIGH:
                if (echo)
                    next_state = MEASURING;

            MEASURING:
                if (!echo)
                    next_state = DONE;

            DONE:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end

endmodule
