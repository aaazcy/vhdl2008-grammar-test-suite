-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SMN_002
-- Related Rule ID: SMN_RECORD_C_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Case Type: Negative
-- Test Focus: Static model negative -- record_constraint field
--            constraint range is wider than the base record field
--            range. A subtype constraint cannot widen a field, only
--            narrow it. Trying to expand 0..7 to 0..15 is illegal.
-- Expected Result: Triggers constraint violation error
-- Dependencies: None
-- =============================================================
entity rec_con_smn_wider is
  port ( dout : out integer );
end entity rec_con_smn_wider;
architecture rtl of rec_con_smn_wider is
  type t_base is record
    val : integer range 0 to 7;
  end record;
  subtype t_bad is t_base(val => 0 to 15);  -- ERROR: cannot widen 0..7 to 0..15
  signal s : t_bad;
begin
  dout <= 0;
end architecture rtl;
