-- =============================================================
-- Case ID: TC_SELECTED_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Negative
-- Rule Description: In a selected_name the suffix must actually exist in the declaration region of the object referenced by the prefix
-- Error Category: Undeclared record field
-- Test Focus: SMN: access to a nonexistent record field——in s_rec.nonexist, nonexist is not a declared field of the prefix record type t_rec
-- Expected Result: Triggers semantic error (field 'nonexist' not declared in record)
-- Dependencies: None
-- =============================================================
entity sel_name_bad_field is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of sel_name_bad_field is
  type t_rec is record x : integer; end record;
  signal s_rec : t_rec := (x => 0);
begin
  -- ERROR: 'nonexist' is not a field of record type t_rec
  q <= '1' when s_rec.nonexist = 0 else '0';
end architecture vhdl2008;
