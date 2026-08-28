-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: index_subtype_definition with natural type_mark.
--            A priority encoder with variable width implemented
--            via an unconstrained array using natural range <>.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity priority_encoder_var is
  port (
    bits_in  : in  bit_vector(7 downto 0);
    highest  : out integer range 0 to 7;
    any_set  : out bit
  );
end entity priority_encoder_var;

architecture rtl of priority_encoder_var is
  -- index_subtype_definition: type_mark = natural, range <>
  type bit_array is array (natural range <>) of bit;
  subtype bit_array_8 is bit_array(0 to 7);
  signal input_bits : bit_array_8;
begin
  input_bits <= bit_array_8(bits_in);
  process(input_bits)
    variable found : bit := '0';
    variable idx   : integer range 0 to 7 := 0;
  begin
    found := '0';
    idx   := 0;
    for i in input_bits'reverse_range loop
      if input_bits(i) = '1' and found = '0' then
        idx := i;
        found := '1';
      end if;
    end loop;
    highest <= idx;
    any_set <= found;
  end process;
end architecture rtl;
