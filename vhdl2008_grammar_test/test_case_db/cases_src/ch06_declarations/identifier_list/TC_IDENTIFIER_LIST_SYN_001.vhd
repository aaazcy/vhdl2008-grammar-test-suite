-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SYN_001
-- Rule Type: Syntax
-- BNF Production: IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Test Focus: identifier_list with a single identifier — the base case of
--   the BNF where the { , identifier } repetition is used zero times.
--   Single identifiers appear in port, signal, constant, and variable
--   declarations. Each declaration uses exactly one identifier.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity single_id_top is
  port (
    clk     : in  bit;
    rst_n   : in  bit;
    data_in : in  bit;
    data_out : out bit
  );
end entity single_id_top;

architecture rtl of single_id_top is
  -- identifier_list with single identifier in each declaration:
  signal s_ff1 : bit;   -- one identifier: s_ff1
  signal s_ff2 : bit;   -- one identifier: s_ff2
  constant C_DELAY : time := 1 ns;  -- one identifier: C_DELAY
begin
  process(clk, rst_n)
    variable v_temp : bit;  -- one identifier: v_temp
  begin
    if rst_n = '0' then
      s_ff1 <= '0';
      s_ff2 <= '0';
    elsif clk'event and clk = '1' then
      v_temp := data_in;
      s_ff1  <= v_temp;
      s_ff2  <= s_ff1;
    end if;
  end process;

  data_out <= s_ff2 after C_DELAY;
end architecture rtl;
