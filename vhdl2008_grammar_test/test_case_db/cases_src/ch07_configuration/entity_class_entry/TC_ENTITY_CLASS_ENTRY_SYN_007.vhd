-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_007
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: group template with multiple entity_class_entry all carrying <> — an all-box entity_class_entry list (signal <>, signal <>, variable <>), verifies the consistency of the optional box on all entries
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ece_all_box is
  port(clk : in bit; d : in bit; q : out bit);
end entity;

architecture rtl of ece_all_box is
  signal s_d1, s_d2 : bit := '0';
  group sync_chain is (signal, signal, signal <>);
  group sc : sync_chain (s_d1, s_d2, q);
begin
  process(clk)
    variable v_tmp : bit;
  begin
    if clk'event and clk = '1' then
      v_tmp := d;
      s_d1 <= v_tmp;
      s_d2 <= s_d1;
      q <= s_d2;
    end if;
  end process;
end architecture rtl;
