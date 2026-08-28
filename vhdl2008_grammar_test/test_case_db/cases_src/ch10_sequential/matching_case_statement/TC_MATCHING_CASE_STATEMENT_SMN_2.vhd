-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_MCS_OVERLAP
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Matching case choices must not overlap
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: overlapping choices in matching case statement
-- Expected Result: Triggers semantic error: overlapping matching case choices
-- Dependencies: None
-- =============================================================
entity mcs_sem1_ent is port(sel:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_sem1_ent is
begin
  process(sel) begin
    case? sel is
      when "00" => y<=0;
      when "01" => y<=10;
      when "0-" => y<=20;
      when others => y<=30;
    end case?;
  end process;
end architecture bh;
