-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: three entity_class_entry entries all without box — "signal, variable, label" three entries all without the box suffix, verifies the legality of a purely non-box form list in process-internal declarations and instance label scenarios
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clk,d : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity ecl_no_box_list is
  port(clk : in bit; d : in bit; q : out bit);
end entity;

architecture rtl of ecl_no_box_list is
  component dff is
    port(clk,d : in bit; q : out bit);
  end component;
  for u_dff : dff use entity work.dff(rtl)
    port map(clk=>clk, d=>d, q=>q);
  signal s_fb : bit := '0';
  group ff_path is (signal, signal, label);
  group fp : ff_path (s_fb, q, u_dff);
begin
  u_dff : dff port map(clk=>clk, d=>d, q=>q);
  s_fb <= q;
end architecture rtl;
