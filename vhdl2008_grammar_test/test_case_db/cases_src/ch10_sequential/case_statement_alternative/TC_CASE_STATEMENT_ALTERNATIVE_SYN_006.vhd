-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: Enumeration type alternatives fully covered: enum values of type color (RED,GREEN,BLUE) each when alternative maps to the corresponding integer value - 4 alternatives fully covered
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn6_ent is port(sel:in integer range 0 to 2; y:out integer); end entity;
architecture bh of csa_syn6_ent is
  type t_color is (RED, GREEN, BLUE);
  signal s_color : t_color;
begin
  process(sel) begin
    case sel is
      when 0 => s_color <= RED;
      when 1 => s_color <= GREEN;
      when 2 => s_color <= BLUE;
    end case;
    case s_color is
      when RED   => y <= 16#FF0000#;
      when GREEN => y <= 16#00FF00#;
      when BLUE  => y <= 16#0000FF#;
    end case;
  end process;
end architecture bh;
