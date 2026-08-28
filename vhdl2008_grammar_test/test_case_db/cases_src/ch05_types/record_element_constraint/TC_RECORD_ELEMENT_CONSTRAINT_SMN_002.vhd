-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_CONSTRAINT_SMN_002
-- Related Rule ID: SMN_RECORD_E_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_constraint ::= record_element_simple_name element_constraint
-- Case Type: Negative
-- Test Focus: Static model negative -- record element constraint
--            references a field name not present in the base record
--            type. The constraint applies to field 'length' which
--            does not exist in t_packet (only addr and data exist).
-- Expected Result: Triggers undefined field error
-- Dependencies: None
-- =============================================================
entity rec_elem_con_smn_bad_field is
  port ( dout : out integer );
end entity rec_elem_con_smn_bad_field;
architecture rtl of rec_elem_con_smn_bad_field is
  type t_packet is record
    addr : integer range 0 to 255;
    data : integer range -128 to 127;
  end record;
  -- Attempt to constrain a non-existent field
  subtype t_bad is t_packet(length => 0 to 15);  -- ERROR: length not a field
  signal s : t_bad;
begin
  dout <= 0;
end architecture rtl;
