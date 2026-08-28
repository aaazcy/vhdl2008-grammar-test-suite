-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= (empty — constraint applied via context)
-- Case Type: Negative
-- Test Focus: Static model negative — record element constraint
--            mismatch. A record type's field is declared with subtype
--            integer range 0 to 7 but an aggregate assignment provides
--            a value outside that constraint range, causing the
--            element_constraint to be violated at the record level.
-- Expected Result: Triggers element constraint bounds error
-- Dependencies: None
-- =============================================================
entity record_elem_constraint_violation is
  port (
    dout : out integer
  );
end entity record_elem_constraint_violation;

architecture rtl of record_elem_constraint_violation is
  type t_pkt is record
    len  : integer range 0 to 7;
    data : integer range -128 to 127;
  end record;
  signal s_pkt : t_pkt := (len => 8, data => 0);  -- ERROR: len=8 exceeds 0..7
begin
  dout <= s_pkt.len;
end architecture rtl;
