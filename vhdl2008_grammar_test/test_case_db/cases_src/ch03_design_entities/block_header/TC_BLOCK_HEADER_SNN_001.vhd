-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Case Type: Negative
-- Test Focus: SNN: Block header generic map missing semicolon — `generic map(G=>1) port(p:in bit)` is missing the semicolon after generic_map_aspect
-- Expected Result: Triggers syntax error: missing ";" after generic map
-- Dependencies: None
-- =============================================================
entity bh_snn1_ent is port(a:in bit; y:out bit); end entity;
architecture bh of bh_snn1_ent is
begin
  b_bad:block generic(G:integer:=1); generic map(G=>2) port(p:in bit); port map(p=>a); begin p<=a; y<=p; end block;
end architecture bh;
