-- =============================================================
-- Case ID: TC_LITERAL_SYN_002
-- Rule Type: Syntax
-- BNF Production: literal
-- IEEE Section: 9.3.3.1
-- BNF Text: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Test Focus: enumeration literal as choice and expression in a simple state transition table
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_literal_syn_002 is
  port (
    clk      : in  bit;
    rst_n    : in  bit;
    next_st  : out bit_vector(1 downto 0)
  );
end entity tc_literal_syn_002;

architecture state_machine of tc_literal_syn_002 is
  type t_state is (IDLE, BUSY, DONE, ERROR_ST);
  signal cur : t_state := IDLE;
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      cur <= IDLE;
    elsif clk'event and clk = '1' then
      case cur is
        when IDLE    => cur <= BUSY;
        when BUSY    => cur <= DONE;
        when DONE    => cur <= IDLE;
        when ERROR_ST => cur <= IDLE;
      end case;
    end if;
  end process;

  with cur select
    next_st <= "00" when IDLE,
               "01" when BUSY,
               "10" when DONE,
               "11" when ERROR_ST;
end architecture state_machine;
