-- =============================================================
-- Case ID: TC_VERIFICATION_UNIT_LIST_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_VERIFICATION_UNIT_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.4
-- Production: verification_unit_list ::= verification_unit_name { , verification_unit_name }
-- Case Type: Negative
-- Test Focus: verification unit name in verification_unit_list conflicts with a signal name in the same architecture — the verification unit name "result_latch" in the list has the same name as the signal "result_latch" declared in the architecture, semantically causing a multiple-definition identifier conflict in the declarative region
-- Expected Result: Triggers semantic error: verification unit name "result_latch" conflicts with signal declaration in the same region
-- Dependencies: None
-- =============================================================
entity buffer_cell is
  port (d : in bit; q : out bit);
end entity buffer_cell;

architecture beh of buffer_cell is
begin
end architecture beh;

entity vul_smn1_ent is
  port(din : in bit; dout : out bit);
end entity vul_smn1_ent;

architecture rtl of vul_smn1_ent is
  component buffer_cell is
    port(d : in bit; q : out bit);
  end component buffer_cell;
  signal result_latch : bit;
  for u_buf : buffer_cell use entity work.buffer_cell(beh)
    port map(d => din, q => dout);
    use vunit result_latch;
  end for;
begin
  result_latch <= din;
  u_buf : buffer_cell port map(d => result_latch, q => dout);
end architecture rtl;
