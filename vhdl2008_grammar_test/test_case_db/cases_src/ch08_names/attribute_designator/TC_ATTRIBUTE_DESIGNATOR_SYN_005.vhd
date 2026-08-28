-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_designator ::= attribute_simple_name
-- Case Type: Positive
-- Test Focus: Predefined attribute designators as attribute_designator — the VHDL predefined attributes 'length, 'left, 'right, 'range are used as attribute_designators, referenced directly through the tick symbol in the attribute_name context without needing a prior declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_predef_desig is
  port(din : in bit_vector(3 downto 0);
       len_out : out integer;
       left_out : out integer;
       right_out : out integer);
end entity;

architecture vhdl2008 of attr_predef_desig is
  signal buf : bit_vector(3 downto 0) := "0000";
  signal len_val, l_val, r_val : integer := 0;
begin
  process(din)
  begin
    buf <= din;
    len_val <= buf'length;
    l_val    <= buf'left;
    r_val    <= buf'right;
  end process;
  len_out <= len_val;
  left_out <= l_val;
  right_out <= r_val;
end architecture vhdl2008;
