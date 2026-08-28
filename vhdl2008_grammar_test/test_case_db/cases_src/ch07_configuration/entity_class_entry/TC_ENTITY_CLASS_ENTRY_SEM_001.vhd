-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SEM_001
-- Related Rule ID: SEM_ENTITY_C_001
-- Rule Type: Semantic
-- BNF Production: ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive (Semantic)
-- Test Focus: semantics of entity_class_entry with box — "signal <>" denotes the unconstrained signal class, a group declaration can match signals of any name to that group template entry, verifies the semantic meaning of box is to wildcard-match all named objects of that class
-- Expected Result: Compiles successfully; unconstrained signal class matches any signal name
-- Dependencies: None
-- =============================================================
entity ece_sem_box_match is
  port(clk : in bit; d0,d1 : in bit; q0,q1 : out bit);
end entity;

architecture rtl of ece_sem_box_match is
  signal s_reg0, s_reg1 : bit := '0';
  signal s_reg2 : bit := '0';
  group flat_signals is (signal, signal, signal <>);
  group fgroup : flat_signals (s_reg0, s_reg1, s_reg2);
  attribute keep_attr : boolean;
  attribute keep_attr of fgroup : group is true;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg0 <= d0;
      s_reg1 <= d1;
      s_reg2 <= s_reg0 xor s_reg1;
    end if;
  end process;
  q0 <= s_reg0;
  q1 <= s_reg2;
end architecture rtl;
