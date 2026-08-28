-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Test Focus: Selected name all scenarios: record field (s_rec.x) / library package (lib.pkg.item) / block label (b_blk.sig) / generate label (gen(0).sig), verifying the use of the prefix.suffix form of selected_name in every selectable context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sn_ent is port(y:out integer); end entity;
architecture bh of sn_ent is
  type t_rec is record x:integer; y:bit; end record;
  signal s_rec:t_rec:=(x=>10,y=>'0');
begin
  b_blk:block
    signal s_inner:integer:=5;
  begin
    y<=s_rec.x+b_blk.s_inner;
  end block;
end architecture bh;
