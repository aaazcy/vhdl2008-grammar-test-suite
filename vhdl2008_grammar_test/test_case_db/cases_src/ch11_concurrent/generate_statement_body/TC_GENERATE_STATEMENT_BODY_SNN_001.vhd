-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Negative
-- Test Focus: SNN: body has a declarative part but lacks "begin"——a concurrent statement is written directly after the signal declaration without the begin keyword, verifying that a generate body with a declarative part must use begin to separate declarations from statements
-- Expected Result: Triggers syntax error: missing "begin" after declarations in generate_statement_body
-- Dependencies: None
-- =============================================================
entity gen_body_snn1_ent is
  port(clk : in bit; din : in bit; dout : out bit; stage : in integer);
end entity gen_body_snn1_ent;
architecture bh of gen_body_snn1_ent is
begin
  gen_err : case stage generate
    when 0 =>
      signal s_reg : bit;
      s_reg <= din;
      dout <= s_reg;
    end;
  end generate gen_err;
end architecture bh;
