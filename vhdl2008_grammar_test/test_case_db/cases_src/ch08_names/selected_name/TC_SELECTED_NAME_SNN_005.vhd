-- =============================================================
-- Case ID: TC_SELECTED_NAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Negative
-- Test Focus: SNN: missing suffix after the dot——s_rec. ends with a dot and has no suffix; the suffix of a selected_name is a required element and cannot be empty
-- Expected Result: Triggers syntax error at missing suffix
-- Dependencies: None
-- =============================================================
entity sel_name_miss_suffix is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of sel_name_miss_suffix is
  type t_rec is record x : integer; end record;
  signal s_rec : t_rec := (x => 0);
begin
  -- ERROR: Missing suffix after dot
  q <= '1' when s_rec. = 0 else '0';
end architecture vhdl2008;
