// Generator : SpinalHDL v1.6.2    git head : 6f25d9a541c42028018402843d80c1b0948f0d13
// Component : PWMaudio
// Git hash  : 30dc8e87219fd4a3e5c4b952b95d802b49b2c7ea

`timescale 1ns/1ps 

module tt_um_thorkn_pwmaudio (
  output wire [1:0] uo_out,   // Dedicated outputs
  input  wire clk,
  input  wire rst_n
);

  wire                pwm_low_out;
  wire                pwm_high_out;
  wire 				        reset;
  
  assign reset = !rst_n;

  PWMaudio pwm_audio (
    .io_pwm_low     (pwm_low_out                ), //o
    .io_pwm_high    (pwm_high_out               ), //o
    .clk            (clk                        ), //i
    .reset          (reset                      )  //i
  );

  assign uo_out[0] = pwm_low_out; 
  assign uo_out[1] = pwm_high_out; 

endmodule

module PWMaudio (
  output              io_pwm_low,
  output              io_pwm_high,
  input               clk,
  input               reset
);
  localparam fsm_adsr_enumDef_BOOT = 3'd0;
  localparam fsm_adsr_enumDef_stateEntry = 3'd1;
  localparam fsm_adsr_enumDef_stateAttack = 3'd2;
  localparam fsm_adsr_enumDef_stateDelay = 3'd3;
  localparam fsm_adsr_enumDef_stateSustain = 3'd4;
  localparam fsm_adsr_enumDef_stateRelease = 3'd5;

  wire                pwm_ctrl_io_pwm_low;
  wire                pwm_ctrl_io_pwm_high;
  wire       [23:0]   _zz_when_PWMaudio_l48;
  wire       [11:0]   _zz_when_PWMaudio_l48_1;
  wire       [23:0]   _zz_when_PWMaudio_l61;
  wire       [12:0]   _zz_when_PWMaudio_l61_1;
  wire       [23:0]   _zz_when_PWMaudio_l75;
  wire       [22:0]   _zz_when_PWMaudio_l75_1;
  wire       [23:0]   _zz_when_PWMaudio_l84;
  wire       [13:0]   _zz_when_PWMaudio_l84_1;
  wire       [3:0]    note_length;
  wire                fsm_adsr_wantExit;
  reg                 fsm_adsr_wantStart;
  wire                fsm_adsr_wantKill;
  reg        [23:0]   fsm_adsr_counter;
  reg        [9:0]    fsm_adsr_level_adsr;
  reg        [2:0]    fsm_adsr_stateReg;
  reg        [2:0]    fsm_adsr_stateNext;
  wire                when_PWMaudio_l48;
  wire                when_PWMaudio_l52;
  wire                when_PWMaudio_l61;
  wire                when_PWMaudio_l65;
  wire                when_PWMaudio_l75;
  wire                when_PWMaudio_l84;
  wire                when_PWMaudio_l88;
  wire                when_StateMachine_l238;
  wire                when_StateMachine_l238_1;
  wire                when_StateMachine_l238_2;
  wire                when_StateMachine_l238_3;
  `ifndef SYNTHESIS
  reg [95:0] fsm_adsr_stateReg_string;
  reg [95:0] fsm_adsr_stateNext_string;
  `endif


  assign _zz_when_PWMaudio_l48_1 = (8'hc8 * note_length);
  assign _zz_when_PWMaudio_l48 = {12'd0, _zz_when_PWMaudio_l48_1};
  assign _zz_when_PWMaudio_l61_1 = (9'h190 * note_length);
  assign _zz_when_PWMaudio_l61 = {11'd0, _zz_when_PWMaudio_l61_1};
  assign _zz_when_PWMaudio_l75_1 = (19'h67c28 * note_length);
  assign _zz_when_PWMaudio_l75 = {1'd0, _zz_when_PWMaudio_l75_1};
  assign _zz_when_PWMaudio_l84_1 = (10'h258 * note_length);
  assign _zz_when_PWMaudio_l84 = {10'd0, _zz_when_PWMaudio_l84_1};
  PWMctrl pwm_ctrl (
    .io_freq        (8'h1a                     ), //i
    .io_level       (fsm_adsr_level_adsr[9:0]  ), //i
    .io_waveform    (1'b1                      ), //i
    .io_pwm_low     (pwm_ctrl_io_pwm_low       ), //o
    .io_pwm_high    (pwm_ctrl_io_pwm_high      ), //o
    .clk            (clk                       ), //i
    .reset          (reset                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_BOOT : fsm_adsr_stateReg_string = "BOOT        ";
      fsm_adsr_enumDef_stateEntry : fsm_adsr_stateReg_string = "stateEntry  ";
      fsm_adsr_enumDef_stateAttack : fsm_adsr_stateReg_string = "stateAttack ";
      fsm_adsr_enumDef_stateDelay : fsm_adsr_stateReg_string = "stateDelay  ";
      fsm_adsr_enumDef_stateSustain : fsm_adsr_stateReg_string = "stateSustain";
      fsm_adsr_enumDef_stateRelease : fsm_adsr_stateReg_string = "stateRelease";
      default : fsm_adsr_stateReg_string = "????????????";
    endcase
  end
  always @(*) begin
    case(fsm_adsr_stateNext)
      fsm_adsr_enumDef_BOOT : fsm_adsr_stateNext_string = "BOOT        ";
      fsm_adsr_enumDef_stateEntry : fsm_adsr_stateNext_string = "stateEntry  ";
      fsm_adsr_enumDef_stateAttack : fsm_adsr_stateNext_string = "stateAttack ";
      fsm_adsr_enumDef_stateDelay : fsm_adsr_stateNext_string = "stateDelay  ";
      fsm_adsr_enumDef_stateSustain : fsm_adsr_stateNext_string = "stateSustain";
      fsm_adsr_enumDef_stateRelease : fsm_adsr_stateNext_string = "stateRelease";
      default : fsm_adsr_stateNext_string = "????????????";
    endcase
  end
  `endif

  assign note_length = 4'b0100;
  assign io_pwm_low = pwm_ctrl_io_pwm_low;
  assign io_pwm_high = pwm_ctrl_io_pwm_high;
  assign fsm_adsr_wantExit = 1'b0;
  always @(*) begin
    fsm_adsr_wantStart = 1'b0;
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_stateEntry : begin
      end
      fsm_adsr_enumDef_stateAttack : begin
      end
      fsm_adsr_enumDef_stateDelay : begin
      end
      fsm_adsr_enumDef_stateSustain : begin
      end
      fsm_adsr_enumDef_stateRelease : begin
      end
      default : begin
        fsm_adsr_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_adsr_wantKill = 1'b0;
  always @(*) begin
    fsm_adsr_stateNext = fsm_adsr_stateReg;
    case(fsm_adsr_stateReg)
      fsm_adsr_enumDef_stateEntry : begin
        fsm_adsr_stateNext = fsm_adsr_enumDef_stateAttack;
      end
      fsm_adsr_enumDef_stateAttack : begin
        if(when_PWMaudio_l52) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateDelay;
        end
      end
      fsm_adsr_enumDef_stateDelay : begin
        if(when_PWMaudio_l65) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateSustain;
        end
      end
      fsm_adsr_enumDef_stateSustain : begin
        if(when_PWMaudio_l75) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateRelease;
        end
      end
      fsm_adsr_enumDef_stateRelease : begin
        if(when_PWMaudio_l88) begin
          fsm_adsr_stateNext = fsm_adsr_enumDef_stateEntry;
        end
      end
      default : begin
      end
    endcase
    if(fsm_adsr_wantStart) begin
      fsm_adsr_stateNext = fsm_adsr_enumDef_stateEntry;
    end
    if(fsm_adsr_wantKill) begin
      fsm_adsr_stateNext = fsm_adsr_enumDef_BOOT;
    end
  end

  assign when_PWMaudio_l48 = (fsm_adsr_counter == _zz_when_PWMaudio_l48);
  assign when_PWMaudio_l52 = (fsm_adsr_level_adsr == 10'h3e8);
  assign when_PWMaudio_l61 = (fsm_adsr_counter == _zz_when_PWMaudio_l61);
  assign when_PWMaudio_l65 = (fsm_adsr_level_adsr == 10'h1f4);
  assign when_PWMaudio_l75 = (fsm_adsr_counter == _zz_when_PWMaudio_l75);
  assign when_PWMaudio_l84 = (fsm_adsr_counter == _zz_when_PWMaudio_l84);
  assign when_PWMaudio_l88 = (fsm_adsr_level_adsr == 10'h0);
  assign when_StateMachine_l238 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateAttack)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateAttack));
  assign when_StateMachine_l238_1 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateDelay)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateDelay));
  assign when_StateMachine_l238_2 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateSustain)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateSustain));
  assign when_StateMachine_l238_3 = ((! (fsm_adsr_stateReg == fsm_adsr_enumDef_stateRelease)) && (fsm_adsr_stateNext == fsm_adsr_enumDef_stateRelease));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_adsr_counter <= 24'h0;
      fsm_adsr_level_adsr <= 10'h0;
      fsm_adsr_stateReg <= fsm_adsr_enumDef_BOOT;
    end else begin
      fsm_adsr_stateReg <= fsm_adsr_stateNext;
      case(fsm_adsr_stateReg)
        fsm_adsr_enumDef_stateEntry : begin
        end
        fsm_adsr_enumDef_stateAttack : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l48) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr + 10'h001);
            fsm_adsr_counter <= 24'h0;
          end
        end
        fsm_adsr_enumDef_stateDelay : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l61) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr - 10'h001);
            fsm_adsr_counter <= 24'h0;
          end
        end
        fsm_adsr_enumDef_stateSustain : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          fsm_adsr_level_adsr <= 10'h1f4;
        end
        fsm_adsr_enumDef_stateRelease : begin
          fsm_adsr_counter <= (fsm_adsr_counter + 24'h000001);
          if(when_PWMaudio_l84) begin
            fsm_adsr_level_adsr <= (fsm_adsr_level_adsr - 10'h001);
            fsm_adsr_counter <= 24'h0;
          end
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l238) begin
        fsm_adsr_counter <= 24'h0;
      end
      if(when_StateMachine_l238_1) begin
        fsm_adsr_counter <= 24'h0;
      end
      if(when_StateMachine_l238_2) begin
        fsm_adsr_counter <= 24'h0;
      end
      if(when_StateMachine_l238_3) begin
        fsm_adsr_counter <= 24'h0;
      end
    end
  end


endmodule

module PWMctrl (
  input      [7:0]    io_freq,
  input      [9:0]    io_level,
  input               io_waveform,
  output              io_pwm_low,
  output              io_pwm_high,
  input               clk,
  input               reset
);

  wire       [4:0]    pwmdriver_low_io_dutyCycle;
  wire       [4:0]    pwmdriver_high_io_dutyCycle;
  wire                pwmdriver_low_io_pwm;
  wire                pwmdriver_high_io_pwm;
  wire       [7:0]    _zz_freq_counter_valueNext;
  wire       [0:0]    _zz_freq_counter_valueNext_1;
  wire       [9:0]    _zz_wave_counter_valueNext;
  wire       [0:0]    _zz_wave_counter_valueNext_1;
  reg        [9:0]    duty_cycle;
  reg                 freq_counter_willIncrement;
  reg                 freq_counter_willClear;
  reg        [7:0]    freq_counter_valueNext;
  reg        [7:0]    freq_counter_value;
  wire                freq_counter_willOverflowIfInc;
  wire                freq_counter_willOverflow;
  reg                 wave_counter_willIncrement;
  wire                wave_counter_willClear;
  reg        [9:0]    wave_counter_valueNext;
  reg        [9:0]    wave_counter_value;
  wire                wave_counter_willOverflowIfInc;
  wire                wave_counter_willOverflow;
  wire                when_PWMctrl_l27;
  wire                when_PWMctrl_l33;
  function  zz_freq_counter_willIncrement(input dummy);
    begin
      zz_freq_counter_willIncrement = 1'b0;
      zz_freq_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;

  assign _zz_freq_counter_valueNext_1 = freq_counter_willIncrement;
  assign _zz_freq_counter_valueNext = {7'd0, _zz_freq_counter_valueNext_1};
  assign _zz_wave_counter_valueNext_1 = wave_counter_willIncrement;
  assign _zz_wave_counter_valueNext = {9'd0, _zz_wave_counter_valueNext_1};
  PWMdriver pwmdriver_low (
    .io_dutyCycle    (pwmdriver_low_io_dutyCycle[4:0]  ), //i
    .io_pwm          (pwmdriver_low_io_pwm             ), //o
    .clk             (clk                              ), //i
    .reset           (reset                            )  //i
  );
  PWMdriver pwmdriver_high (
    .io_dutyCycle    (pwmdriver_high_io_dutyCycle[4:0]  ), //i
    .io_pwm          (pwmdriver_high_io_pwm             ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  assign io_pwm_low = pwmdriver_low_io_pwm;
  assign io_pwm_high = pwmdriver_high_io_pwm;
  assign _zz_1 = zz_freq_counter_willIncrement(1'b0);
  always @(*) freq_counter_willIncrement = _zz_1;
  always @(*) begin
    freq_counter_willClear = 1'b0;
    if(when_PWMctrl_l27) begin
      freq_counter_willClear = 1'b1;
    end
  end

  assign freq_counter_willOverflowIfInc = (freq_counter_value == 8'hff);
  assign freq_counter_willOverflow = (freq_counter_willOverflowIfInc && freq_counter_willIncrement);
  always @(*) begin
    freq_counter_valueNext = (freq_counter_value + _zz_freq_counter_valueNext);
    if(freq_counter_willClear) begin
      freq_counter_valueNext = 8'h0;
    end
  end

  always @(*) begin
    wave_counter_willIncrement = 1'b0;
    if(when_PWMctrl_l27) begin
      wave_counter_willIncrement = 1'b1;
    end
  end

  assign wave_counter_willClear = 1'b0;
  assign wave_counter_willOverflowIfInc = (wave_counter_value == 10'h3ff);
  assign wave_counter_willOverflow = (wave_counter_willOverflowIfInc && wave_counter_willIncrement);
  always @(*) begin
    wave_counter_valueNext = (wave_counter_value + _zz_wave_counter_valueNext);
    if(wave_counter_willClear) begin
      wave_counter_valueNext = 10'h0;
    end
  end

  assign pwmdriver_low_io_dutyCycle = duty_cycle[4 : 0];
  assign pwmdriver_high_io_dutyCycle = duty_cycle[9 : 5];
  assign when_PWMctrl_l27 = (freq_counter_value == io_freq);
  assign when_PWMctrl_l33 = (wave_counter_value < 10'h200);
  always @(*) begin
    if(when_PWMctrl_l33) begin
      duty_cycle = 10'h0;
    end else begin
      duty_cycle = io_level;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      freq_counter_value <= 8'h0;
      wave_counter_value <= 10'h0;
    end else begin
      freq_counter_value <= freq_counter_valueNext;
      wave_counter_value <= wave_counter_valueNext;
    end
  end


endmodule

//PWMdriver replaced by PWMdriver

module PWMdriver (
  input      [4:0]    io_dutyCycle,
  output              io_pwm,
  input               clk,
  input               reset
);

  wire       [4:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 counter_willIncrement;
  wire                counter_willClear;
  reg        [4:0]    counter_valueNext;
  reg        [4:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  function  zz_counter_willIncrement(input dummy);
    begin
      zz_counter_willIncrement = 1'b0;
      zz_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_1;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {4'd0, _zz_counter_valueNext_1};
  assign _zz_1 = zz_counter_willIncrement(1'b0);
  always @(*) counter_willIncrement = _zz_1;
  assign counter_willClear = 1'b0;
  assign counter_willOverflowIfInc = (counter_value == 5'h1f);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    counter_valueNext = (counter_value + _zz_counter_valueNext);
    if(counter_willClear) begin
      counter_valueNext = 5'h0;
    end
  end

  assign io_pwm = (counter_value < io_dutyCycle);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 5'h0;
    end else begin
      counter_value <= counter_valueNext;
    end
  end


endmodule
