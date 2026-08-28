-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Element constraint with an index constraint on a
--   bit_vector field of a record that also holds a physical time
--   field. Verifies the element_constraint production alongside
--   physical types.
-- Expected Result: Compiles; array field constrained
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_physical is
  port (
    sel    : in  bit;
    delay  : out time
  );
end entity rec_elem_constraint_physical;

architecture elem_phys_constraint of rec_elem_constraint_physical is
  type t_timing is record
    setup  : time;
    hold   : bit_vector;
  end record;
  signal timing : t_timing(hold(0 to 15)) := (setup => 1 ns, hold => (others => '0'));
begin
  timing.setup <= 15 ns when sel = '1' else 5 ns;
  timing.hold  <= (others => '1');
  delay <= timing.setup * timing.hold'length;
end architecture elem_phys_constraint;
