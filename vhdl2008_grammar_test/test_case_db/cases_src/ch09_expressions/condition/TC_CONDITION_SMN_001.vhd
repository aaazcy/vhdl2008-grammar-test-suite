-- =============================================================
-- Case ID: TC_CONDITION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITION_IMPLICIT_OP
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Negative
-- Rule Description: VHDL 2008 allows implicit condition operator (??) to convert certain types to boolean in condition contexts. However, this applies only to types with defined condition conversion.
-- Error Category: Type error — no implicit conversion
-- Test Focus: SMN: the implicit condition operator ?? cannot be used for a type with no defined conversion — a custom enumeration type used as the condition in if, and the type has no ?? operator defined
-- Expected Result: Triggers type error: no condition conversion available for this type
-- Dependencies: None
-- =============================================================

entity ent_cond_smn_001 is
  port (st : in bit);
end entity ent_cond_smn_001;

architecture implicit_fail of ent_cond_smn_001 is
  type t_my_state is (ON_STATE, OFF_STATE);
  signal s_state : t_my_state := ON_STATE;
begin
  process(st)
  begin
    if st'event and st = '1' then
      -- ERROR: No implicit condition conversion defined for t_my_state
      if s_state then
        null;
      end if;
    end if;
  end process;
end architecture implicit_fail;
