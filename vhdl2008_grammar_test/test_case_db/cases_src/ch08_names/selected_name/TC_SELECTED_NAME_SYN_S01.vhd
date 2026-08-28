-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Test Focus: Selected name: prefix . suffix — dot-separated hierarchical name (library.package.item, record.field)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_selected_name_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_selected_name_syn_s01 is
  type t_rec is record x:integer; y:bit; end record;
  signal s_rec:t_rec;
begin
  s_rec.x<=42;  -- selected_name "s_rec.x"
  r<=s_rec.x;end architecture bh;
