-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Record constraint applied in a subtype declaration
--   rather than directly in a signal declaration. Tests that
--   record_constraint is parsed in the subtype context.
-- Expected Result: Compiles; subtype with constraint used for signal
-- Dependencies: None
-- =============================================================
entity record_constraint_in_subtype is
  port (
    en   : in  bit;
    result : out integer
  );
end entity record_constraint_in_subtype;

architecture subtype_record_constraint of record_constraint_in_subtype is
  type t_generic_rec is record
    a : integer;
    b : bit_vector;
  end record;
  subtype t_constrained_rec is t_generic_rec(b(0 to 15));
  signal s : t_constrained_rec;
begin
  process(en)
  begin
    if en = '1' then
      s.a <= s.a + 1;
    end if;
  end process;
  result <= s.a;
end architecture subtype_record_constraint;
