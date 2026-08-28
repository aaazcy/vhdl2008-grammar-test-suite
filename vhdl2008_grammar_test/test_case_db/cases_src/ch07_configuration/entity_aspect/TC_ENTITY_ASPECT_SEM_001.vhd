-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SEM_001
-- Related Rule ID: SEM_ENTITY_A_001
-- Rule Type: Semantic
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive (Semantic)
-- Test Focus: architecture_identifier in an entity aspect selects the correct architecture body - the same entity has two architectures (beh and rtl), and the entity_aspect specifies (rtl) to bind to the RTL implementation, verifying the semantic selection role of architecture_identifier
-- Expected Result: Compiles successfully; binding selects specified architecture
-- Dependencies: None
-- =============================================================
entity sem_dual_arch_ent is
  port(a,b : in bit; y : out bit);
end entity;

architecture beh of sem_dual_arch_ent is
begin
  y <= a and b;
end architecture beh;

architecture rtl of sem_dual_arch_ent is
begin
  y <= not (not a or not b);
end architecture rtl;

entity easp_sem_arch_select is
  port(a1,b1,a2,b2 : in bit; y1,y2 : out bit);
end entity;

architecture rtl of easp_sem_arch_select is
  component gate_and is
    port(a,b : in bit; y : out bit);
  end component;
  for u_beh : gate_and use entity work.sem_dual_arch_ent(beh)
    port map(a=>a1, b=>b1, y=>y1);
  for u_rtl : gate_and use entity work.sem_dual_arch_ent(rtl)
    port map(a=>a2, b=>b2, y=>y2);
begin
  u_beh : gate_and port map(a=>a1, b=>b1, y=>y1);
  u_rtl : gate_and port map(a=>a2, b=>b2, y=>y2);
end architecture rtl;
