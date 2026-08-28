-- =============================================================
-- Case ID: TC_CHOICE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: choice
-- IEEE Section: 9.3.3.1
-- BNF Text: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Test Focus: simple_expression as choice in case statement for an FSM state machine
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_choice_syn_s01 is
  port (
    clk    : in  bit;
    rst_n  : in  bit;
    cmd    : in  bit_vector(1 downto 0);
    state  : out bit_vector(1 downto 0)
  );
end entity tc_choice_syn_s01;

architecture fsm of tc_choice_syn_s01 is
  type t_fsm is (IDLE, FETCH, DECODE, EXECUTE);
  signal cur_state : t_fsm := IDLE;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      cur_state <= IDLE;
    elsif clk'event and clk = '1' then
      case cur_state is
        when IDLE =>
          if cmd = "00" then cur_state <= IDLE;
          else cur_state <= FETCH; end if;
        when FETCH =>
          cur_state <= DECODE;
        when DECODE =>
          if cmd = "11" then cur_state <= EXECUTE;
          else cur_state <= IDLE; end if;
        when EXECUTE =>
          cur_state <= IDLE;
      end case;
    end if;
  end process;

  with cur_state select
    state <= "00" when IDLE,
             "01" when FETCH,
             "10" when DECODE,
             "11" when EXECUTE;
end architecture fsm;
