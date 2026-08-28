-- =============================================================
-- Case ID: TC_CONSTRAINT_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: static model negative -- record constraint field widening (illegal)
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity con_smn_widen is port(dout:out integer); end entity;
architecture rtl of con_smn_widen is
  type t_base is record val:integer range 0 to 7; end record;
  subtype t_bad is t_base(val=>0 to 15);  -- ERROR: cannot widen 0..7 to 0..15
begin dout<=0; end architecture;