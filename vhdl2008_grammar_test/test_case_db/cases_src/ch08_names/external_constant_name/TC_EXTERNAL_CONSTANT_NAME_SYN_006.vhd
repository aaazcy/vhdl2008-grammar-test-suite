-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: external constant name using the std_logic_vector type — <<constant .top.gen_block(0).DEFAULT_MASK : std_logic_vector(7 downto 0)>>, verifying that the subtype_indication uses the constrained_array form and the external_pathname contains a generate label index
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_const_array_type is
  port(data_in : in bit_vector(7 downto 0);
       masked_out : out bit_vector(7 downto 0));
end entity;

architecture vhdl2008 of ext_const_array_type is
  alias C_MASK is <<constant .top.gen_block.DEFAULT_MASK : bit_vector(7 downto 0)>>;
  signal masked : bit_vector(7 downto 0) := (others => '0');
begin
  process(data_in)
  begin
    masked <= data_in and C_MASK;
  end process;
  masked_out <= masked;
end architecture vhdl2008;
