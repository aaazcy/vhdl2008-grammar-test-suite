-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Positive
-- Test Focus: all 4 subclasses of basic_graphic_character appearing together in the same architecture — upper_case_letter('A'), digit('9'), special_character('#'), space_character(' '), verify their mutually independent syntactic correctness
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bgc_all_four_subclass is
  port (
    letter : out character;
    digit  : out character;
    spec   : out character;
    space  : out character
  );
end entity bgc_all_four_subclass;

architecture rtl of bgc_all_four_subclass is
begin
  letter <= 'A';
  digit  <= '9';
  spec   <= '#';
  space  <= ' ';
end architecture rtl;
