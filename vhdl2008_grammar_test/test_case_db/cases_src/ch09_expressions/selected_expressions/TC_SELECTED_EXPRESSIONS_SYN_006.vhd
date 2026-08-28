-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: enumeration names and pipe separator used in choices — when RED or BLUE selects multiple enumeration values mapped to the same output
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_enum is
  port (
    col  : in  bit;
    flag : out bit
  );
end entity ent_se_enum;

architecture enum_choice of ent_se_enum is
  type t_color is (RED, GREEN, BLUE);
  signal s_c : t_color;
begin
  process(col)
  begin
    if col'event and col = '1' then
      case s_c is
        when RED | GREEN => flag <= '1';
        when BLUE => flag <= '0';
      end case;
    end if;
  end process;
end architecture enum_choice;
