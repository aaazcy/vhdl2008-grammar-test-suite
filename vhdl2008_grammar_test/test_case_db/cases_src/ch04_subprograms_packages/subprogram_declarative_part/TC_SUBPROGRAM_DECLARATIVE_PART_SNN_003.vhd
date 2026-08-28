-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Negative
-- Test Focus: subprogram_declarative_part: variable declared after use — items in the declarative part are processed top-to-bottom; a constant or variable used in another declaration must appear before its use; referencing a variable before it is declared is a scope error
-- Expected Result: Triggers semantic error: identifier not declared
-- Dependencies: None
-- =============================================================
entity sdp_use_before_decl is
  port (
    val : out natural
  );
end entity;

architecture test of sdp_use_before_decl is
  function f_ref(a : natural) return natural is
    -- constant that references variable v_base declared later
    constant C_OFFSET : natural := natural(v_base) + 5; -- ERROR: v_base not yet declared

    variable v_base : natural := a;
  begin
    return v_base + C_OFFSET;
  end function;

  constant C_IN : natural := 10;
begin
  val <= f_ref(C_IN);
end architecture test;
