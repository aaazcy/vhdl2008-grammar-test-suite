-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ATTRIBUTE_DESIGNATOR_001
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Rule Description: When referenced in an attribute_name, the attribute_designator must reference an already declared attribute (predefined or user-defined)
-- Test Focus: Positive semantic case — the user-defined attribute_designator timing_info is first created by an attribute declaration, then assigned to a signal through an attribute specification, and finally its attribute value is read through sig'timing_info, forming a fully legal reference chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_desig_valid_chain is
  port(clk : in bit; attr_val : out time);
end entity;

architecture vhdl2008 of attr_desig_valid_chain is
  attribute timing_info : time;
  signal clk_buf : bit := '0';
  attribute timing_info of clk_buf : signal is 2.5 ns;
  signal captured : time := 0 fs;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      captured <= clk_buf'timing_info;
    end if;
  end process;
  attr_val <= captured;
end architecture vhdl2008;
