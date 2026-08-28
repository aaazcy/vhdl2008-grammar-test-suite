-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Test Focus: Element constraint with array index constraint on a
--   bit_vector field. The element 'payload' gets an index_constraint
--   via the element_constraint production, constraining its range.
-- Expected Result: Compiles; array field constrained
-- Dependencies: None
-- =============================================================
entity rec_elem_constraint_array is
  port (
    din   : in  bit_vector(7 downto 0);
    dout  : out bit_vector(7 downto 0)
  );
end entity rec_elem_constraint_array;

architecture elem_arr_constraint of rec_elem_constraint_array is
  type t_msg is record
    header  : bit_vector;
    payload : bit_vector;
    footer  : bit;
  end record;
  -- Each element constraint: name + index/range constraint
  signal msg : t_msg(header(0 to 7), payload(0 to 7))
    := (header => (others => '0'), payload => (others => '0'), footer => '0');
begin
  msg.payload(0 to 7) <= din;
  dout <= msg.payload(0 to 7);
end architecture elem_arr_constraint;
