-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Record constraint with multiple comma-separated element
--   constraints. Exercises the repetition clause of the BNF
--   ({ , record_element_constraint }) with three fields.
-- Expected Result: Compiles; all three fields constrained
-- Dependencies: None
-- =============================================================
entity record_constraint_multi_element is
  port (
    run   : in  bit;
    addr  : out integer;
    data  : out bit_vector(7 downto 0)
  );
end entity record_constraint_multi_element;

architecture multi_elem_constraint of record_constraint_multi_element is
  type t_bus_cmd is record
    address  : bit_vector;
    payload  : bit_vector;
    strobe   : bit_vector;
  end record;
  signal cmd : t_bus_cmd(address(0 to 9), payload(0 to 7), strobe(0 to 0))
    := (address => (others => '0'), payload => (others => '0'), strobe => (others => '0'));
begin
  addr <= cmd.address'length;
  data <= cmd.payload(0 to 7);
end architecture multi_elem_constraint;
