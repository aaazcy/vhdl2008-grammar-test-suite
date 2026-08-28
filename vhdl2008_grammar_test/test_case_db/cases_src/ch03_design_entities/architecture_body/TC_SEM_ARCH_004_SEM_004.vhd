-- =============================================================
-- Case ID: TC_SEM_ARCH_004_SEM_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_004
-- Standard Reference: IEEE 1076-2008 Section 3.3.1, Section 11.8
-- Rule Description: All generate statement labels within the same architecture must be unique - generate labels with different names are legal
-- Case Type: Positive
-- Error Category: declaration_elaboration_error
-- Test Focus: Positive case: architecture contains 3 generate statements (for-generate "gen_ff", if-generate "gen_inv", for-generate "gen_out"), each with a different label name, verifying differently named generate labels can coexist with component inst/concurrent assignment/block inside
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sem_arch_004_ent is
  generic(N:integer:=4);
  port(din:in bit_vector(N-1 downto 0); dout:out bit_vector(N-1 downto 0));
end entity;
architecture unique_gens of sem_arch_004_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s_chain:bit_vector(N-1 downto 0);
  signal s_out:bit_vector(N-1 downto 0);
begin
  gen_ff:for i in 0 to N-1 generate
    s_chain(i)<=din(i);
  end generate;
  gen_inv:if N>1 generate
    gen_inner:for i in 0 to N-1 generate
      u_inv:inv port map(x=>s_chain(i),z=>s_out(i));
    end generate;
  end generate;
  gen_out:for i in 0 to N-1 generate
    dout(i)<=s_out(i);
  end generate;
end architecture unique_gens;
