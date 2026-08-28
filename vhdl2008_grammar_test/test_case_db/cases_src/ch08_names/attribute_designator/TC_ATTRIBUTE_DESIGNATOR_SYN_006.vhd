-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: Application of a user-defined attribute designator in attribute value reading — after declaring attribute fanout_limit, the signal's attribute value is read through the attribute_name (sig'fanout_limit), verifying that a custom attribute_designator is referenced as the attribute name after the tick symbol
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_user_read is
  port(clk : in bit; fanout_read : out integer);
  attribute fanout_limit : integer;
  attribute fanout_limit of clk : signal is 16;
end entity;

architecture vhdl2008 of attr_user_read is
  signal val : integer := 0;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      val <= clk'fanout_limit;
    end if;
  end process;
  fanout_read <= val;
end architecture vhdl2008;
