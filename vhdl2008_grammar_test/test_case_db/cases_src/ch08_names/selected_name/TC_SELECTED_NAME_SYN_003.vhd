-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Test Focus: selected_name accessing a record field——s_rec.field_name uses the selected_name form whose prefix is the record signal name and whose suffix is a member field name, verifying the most basic prefix.suffix dot-selection syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_name_rec_field is
  port(din : in integer; field_out : out integer);
end entity;

architecture vhdl2008 of sel_name_rec_field is
  type t_point is record x : integer; y : integer; end record;
  signal s_pt : t_point := (x => 0, y => 0);
begin
  process(din)
  begin
    s_pt.x <= din;
    field_out <= s_pt.x;
  end process;
end architecture vhdl2008;
