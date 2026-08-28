-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry_list ::= entity_class_entry { , entity_class_entry }
-- Case Type: Positive
-- Test Focus: entity_class_entry_list with all unconstrained entries — all entity_class_entry items use '<>' box, meaning all are unconstrained in the group template
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ecl_all_box_ent is
  port(clk : in bit; rst : in bit; q : out bit);
end entity;

architecture bh of ecl_all_box_ent is
  group all_unconstrained is (signal, signal, signal <>);
  group clk_path : all_unconstrained (clk, rst, q);
  signal r : bit := '0';
begin
  process(clk, rst)
  begin
    if rst = '1' then r <= '0';
    elsif clk'event and clk = '1' then r <= '1';
    end if;
  end process;
  q <= r;
end architecture bh;
