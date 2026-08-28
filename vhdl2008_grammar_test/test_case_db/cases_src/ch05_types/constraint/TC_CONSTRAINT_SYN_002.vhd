-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint array_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: constraint: with function and procedure declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity constraint_q2 is
  port (
    result : out integer
  );
end entity constraint_q2;

architecture comprehensive of constraint_q2 is
  -- Custom integer types
  type t_uint8  is range 0 to 255;
  type t_int16  is range -32768 to 32767;
  subtype t_byte is t_uint8 range 0 to 127;

  -- Enumeration types
  type t_state  is (IDLE, READ, WRITE, DONE, ERROR_STATE);
  type t_opcode is (NOP, LOAD, STORE, ADD, SUB, MUL, DIV, HALT);
  type t_color  is (RED, GREEN, BLUE, YELLOW, PURPLE);

  -- Array types (1D and 2D)
  type t_vector is array(0 to 15) of integer;
  type t_matrix is array(0 to 3, 7 downto 0) of bit;
  subtype t_byte_vec is bit_vector(7 downto 0);

  -- Record types
  type t_packet is record
    header  : bit_vector(7 downto 0);
    payload : bit_vector(31 downto 0);
    crc     : bit_vector(7 downto 0);
  end record;
  type t_point is record x, y, z : integer; end record;

  -- Constants
  constant C_WIDTH  : integer := 8;
  constant C_TIMEOUT : time    := 100 ns;
  constant C_PI      : real    := 3.14159265;

  -- Signals
  signal s_val   : t_uint8  := 0;
  signal s_state : t_state  := IDLE;
  signal s_vec   : t_vector := (others => 0);
  signal s_pkt   : t_packet := (header=>(others=>'0'), payload=>(others=>'0'), crc=>(others=>'0'));
  signal s_pt    : t_point  := (x=>0, y=>0, z=>0);
  signal s_clk   : bit := '0';
  signal s_data  : t_byte_vec := (others => '0');


  -- Function for calculation
  function f_checksum(data : bit_vector) return bit_vector is
    variable v : bit_vector(7 downto 0) := (others => '0');
  begin
    for i in data'range loop
      v := v xor (v(6 downto 0) & '0');
    end loop;
    return v;
  end function;

begin
  -- Clock generator
  s_clk <= not s_clk after 5 ns;

  -- State machine process
  process(s_clk)
    variable v_cnt : integer range 0 to 255 := 0;
  begin
    if s_clk'event and s_clk = '1' then
      case s_state is
        when IDLE =>
          if s_val < 128 then s_state <= READ;
          else s_state <= DONE; end if;
        when READ =>
          s_val <= s_val + 1;
          s_vec(v_cnt mod 16) <= integer(s_val);
          v_cnt := v_cnt + 1;
          if v_cnt > 200 then s_state <= WRITE; end if;
        when WRITE =>
          s_pkt.header <= s_data;
          s_state <= DONE;
        when DONE =>
          s_pt.x <= integer(s_val);
          s_pt.y <= v_cnt;
          s_state <= IDLE;
        when ERROR_STATE =>
          s_state <= IDLE;
      end case;
    end if;
  end process;

  -- Concurrent signal assignment
  s_data <= s_pkt.header xor s_pkt.crc;

  result <= integer(s_val);
end architecture comprehensive;