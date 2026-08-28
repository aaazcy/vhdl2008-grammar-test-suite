-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_MCS_OVERLAP
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Negative
-- Test Focus: SMN: matching case choices overlap — when "00" and when "0-" overlap, "00" matches both choices at the same time
-- Expected Result: Triggers semantic error: overlapping choices in matching case statement
-- Dependencies: None
-- =============================================================
entity mcs_smn2_ent is port(sel:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_smn2_ent is
begin
  process(sel) begin
    case? sel is
      when "00" => y <= 0;
      when "0-" => y <= 1;
    end case?;
  end process;
end architecture bh;
