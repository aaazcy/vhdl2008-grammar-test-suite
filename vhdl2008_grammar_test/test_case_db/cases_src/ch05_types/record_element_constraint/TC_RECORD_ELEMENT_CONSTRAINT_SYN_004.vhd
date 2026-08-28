-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Multiple record_element_constraints in a for-generate
--   style, each referencing a different element with a unique
--   constraint form. Tests that each element_constraint is parsed
--   independently per record_element_simple_name.
-- Expected Result: Compiles; independently constrained fields
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_per_field is
  port (
    run     : in  bit;
    addr_out : out integer;
    data_out : out bit_vector(3 downto 0)
  );
end entity rec_elem_constraint_per_field;

architecture per_field_constraint of rec_elem_constraint_per_field is
  type t_device is record
    dev_addr : bit_vector;
    dev_data : bit_vector;
    dev_mode : bit;
  end record;
  signal dev : t_device(dev_addr(0 to 9), dev_data(3 downto 0))
    := (dev_addr => (others => '0'), dev_data => (others => '0'), dev_mode => '1');
begin
  dev.dev_addr <= "1000000000" when run = '1' else (others => '0');
  dev.dev_data(3 downto 0) <= "1010";
  addr_out <= dev.dev_addr'length;
  data_out <= dev.dev_data(3 downto 0);
end architecture per_field_constraint;
