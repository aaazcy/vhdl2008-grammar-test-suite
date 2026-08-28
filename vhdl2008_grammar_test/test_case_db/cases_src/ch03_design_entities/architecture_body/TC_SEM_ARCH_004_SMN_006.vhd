-- =============================================================
-- Case ID: TC_SEM_ARCH_004_SMN_006
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_004
-- Standard Reference: IEEE 1076-2008 Section 3.3.1, Section 11.8
-- Rule Description: Generate labels within the same architecture must be unique - a duplicate label triggers declaration_elaboration_error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative case: 2 for-generates both use label "gen_same", the second generate finds a label conflict in the architecture statement part, verifying the analyzer applies the same declarative-region uniqueness check to generate_label as to signals/constants
-- Expected Result: Triggers semantic error: duplicate generate label in architecture
-- Dependencies: None
-- =============================================================
entity sem_arch_004_bad is
  generic(N:integer:=4);
  port(din:in bit_vector(N-1 downto 0); dout:out bit_vector(N-1 downto 0));
end entity;
architecture dup_gen of sem_arch_004_bad is
  signal s_tmp:bit_vector(N-1 downto 0);
begin
  gen_same:for i in 0 to N-1 generate
    s_tmp(i)<=din(i);
  end generate;
  gen_same:for i in 0 to N-1 generate
    dout(i)<=s_tmp(i);
  end generate;
end architecture dup_gen;
