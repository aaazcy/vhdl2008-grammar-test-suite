-- =============================================================
-- Case ID: TC_SELECTED_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Test Focus: selected_name with multi-level nested records——s_top.inner.field is a three-level selected_name accessing the deep field of a nested record, verifying that selected_name supports arbitrary nesting depth (the prefix itself can be a selected_name)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_name_nested_rec is
  port(clk : in bit; val_out : out integer);
end entity;

architecture vhdl2008 of sel_name_nested_rec is
  type t_inner is record val : integer; flag : bit; end record;
  type t_outer is record inner : t_inner; id : natural; end record;
  signal s_rec : t_outer := (inner => (val => 0, flag => '0'), id => 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      s_rec.inner.val <= s_rec.inner.val + 1;
    end if;
    val_out <= s_rec.inner.val;
  end process;
end architecture vhdl2008;
