-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: Triple-nested if with arithmetic condition on each level — outer if checks sig_a enabling middle layer, middle if checks sig_b range, inner if checks sig_c parity via mod; each level contributes one of three signal outputs (en_o/pass_o/parity_o) to demonstrate cascaded if_statement nesting producing independent control outputs without dead declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_nested_ctrl_ent is port(
  sig_a, sig_b, sig_c : in  integer range 0 to 15;
  en_o                : out bit;
  pass_o              : out bit;
  parity_o            : out bit
); end entity;
architecture bh of if_nested_ctrl_ent is
begin
  process(sig_a, sig_b, sig_c) begin
    if sig_a > 0 then
      en_o <= '1';
      if sig_b > 7 then
        pass_o <= '1';
        if sig_c mod 2 = 0 then parity_o <= '1';
        else parity_o <= '0';
        end if;
      else pass_o <= '0'; parity_o <= '0';
      end if;
    else en_o <= '0'; pass_o <= '0'; parity_o <= '0';
    end if;
  end process;
end architecture bh;
