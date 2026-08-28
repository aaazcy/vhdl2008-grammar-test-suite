-- =============================================================
-- Case ID: TC_TARGET_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: target: slice name target — bit_vector slice s_vec(7 downto 4) as assignment target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity target_syn5_ent is port(nibble:in bit_vector(3 downto 0); y:out bit_vector(7 downto 0)); end entity;
architecture bh of target_syn5_ent is
  signal s_vec:bit_vector(7 downto 0):=X"00";
begin
  process(nibble) is
  begin
    s_vec(7 downto 4) <= nibble;
  end process;
  y <= s_vec;
end architecture bh;
