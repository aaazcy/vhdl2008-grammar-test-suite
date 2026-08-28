-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Negative
-- Test Focus: SNN: the alternative_label after "end" at the body end is inconsistent with the declaration——`end alt_wrong;` the label name does not match the alternative_label declared by the when branch, verifying that the label after end must match the corresponding when branch label
-- Expected Result: Triggers syntax error: alternative label mismatch in generate_statement_body end
-- Dependencies: None
-- =============================================================
entity gen_body_snn4_ent is
  port(din : in bit; dout : out bit; sel : in integer);
end entity gen_body_snn4_ent;
architecture bh of gen_body_snn4_ent is
begin
  gen_mis : case sel generate
    when alt_a : 0 =>
      dout <= din;
    end alt_b;
  end generate gen_mis;
end architecture bh;
