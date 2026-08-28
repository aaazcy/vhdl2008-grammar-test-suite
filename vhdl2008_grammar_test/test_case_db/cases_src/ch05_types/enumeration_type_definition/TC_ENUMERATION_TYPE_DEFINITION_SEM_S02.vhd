-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SEM_S02
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Enumeration type used as a function return type with positional ordering semantics -- validates that the literals declared in the parenthesized comma-separated list possess correct position numbers (0,1,2,...) and that relational operators (<, >, <=, >=) reflect the lexical declaration order of the enumeration_literal list, proving the semantic ordering property inherent to enumeration types
-- Expected Result: Compiles and elaborates successfully
-- Dependencies: None
-- =============================================================
entity enum_func_ent is
  port(
    a, b : in  integer range 0 to 3;
    gt   : out bit
  );
end entity;

architecture rtl of enum_func_ent is
  type t_level is (L0, L1, L2, L3);

  function to_level(x : integer range 0 to 3) return t_level is
  begin
    case x is
      when 0 => return L0;
      when 1 => return L1;
      when 2 => return L2;
      when 3 => return L3;
    end case;
  end function;

  signal la, lb : t_level;
begin
  la <= to_level(a);
  lb <= to_level(b);

  process(la, lb)
  begin
    if la > lb then
      gt <= '1';
    else
      gt <= '0';
    end if;
  end process;
end architecture rtl;
