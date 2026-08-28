-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Rule Description: Concurrent statements within a generate body must reference signals and objects visible in the enclosing scope; references to objects declared in sibling generate bodies are not visible
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SMN: a concurrent statement in a generate body referencing the local signal of another body instance——for generate iteration i references the s_local of iteration j, verifying that accessing a local declaration across generate bodies is illegal
-- Expected Result: Triggers semantic error: signal declared in another generate body not visible
-- Dependencies: None
-- =============================================================
entity gen_body_smn2_ent is
  port(clk : in bit; din : in bit; dout : out bit);
end entity gen_body_smn2_ent;
architecture bh of gen_body_smn2_ent is
  signal s_chain : bit_vector(0 to 2);
begin
  s_chain(0) <= din;
  gen_a : for i in 0 to 1 generate
    signal s_local : bit;
  begin
    s_local <= s_chain(i);
    proc_ff : process(clk) is
    begin
      if clk'event and clk = '1' then
        if i = 0 then
          s_chain(i+1) <= gen_a(1).s_local;
        end if;
      end if;
    end process proc_ff;
  end generate gen_a;
  dout <= s_chain(1);
end architecture bh;
