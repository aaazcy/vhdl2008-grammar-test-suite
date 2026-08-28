-- =============================================================
-- Case ID: TC_RANGE_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests range_attribute_name with a signal's range
--   attribute (s_vec'range) used in a generate statement. The
--   generate instantiates per-element logic whose range is
--   derived from the signal itself.
-- Expected Result: Compiles; each bit XORed with mask
-- Dependencies: None
-- =============================================================
entity range_signal_attr_generate is
  port (
    data_in  : in  bit_vector(3 downto 0);
    mask     : in  bit_vector(3 downto 0);
    data_out : out bit_vector(3 downto 0)
  );
end entity range_signal_attr_generate;

architecture signal_range_gen of range_signal_attr_generate is
begin
  gen_xor: for i in data_in'range generate
    data_out(i) <= data_in(i) xor mask(i);
  end generate;
end architecture signal_range_gen;
