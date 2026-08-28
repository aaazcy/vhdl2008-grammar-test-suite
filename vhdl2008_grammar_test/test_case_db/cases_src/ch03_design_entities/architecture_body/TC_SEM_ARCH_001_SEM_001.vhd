-- =============================================================
-- Case ID: TC_SEM_ARCH_001_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_001
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Multiple architectures of the same entity must use different architecture names - architectures with different names coexisting is legal
-- Case Type: Positive
-- Error Category: declaration_elaboration_error
-- Test Focus: Positive case: the same entity (sem_arch_001_ent) has 2 differently named architectures (structural and behavioral), each using a different implementation style, verifying differently named architectures can legally coexist for the same entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sem_arch_001_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture structural of sem_arch_001_ent is
  component and_gate is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and_gate port map(x1=>a,x2=>b,z=>s);
  y<=s;
end architecture structural;
architecture behavioral of sem_arch_001_ent is
begin
  process(a,b) begin
    if a='1' and b='1' then y<='1'; else y<='0'; end if;
  end process;
end architecture behavioral;
