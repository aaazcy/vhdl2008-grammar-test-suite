-- =============================================================
-- Case ID: TC_SIGN_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SIGN_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Rule Description: The unary operators + and - are predefined for any numeric type. The operand and result are of the same type.
-- Test Focus: Semantic correctness of sign on the three numeric types integer/real/time — apply the unary + and - to each numeric type respectively, verifying the type preservation rule of sign over all numeric types predefined in the VHDL standard
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sem_sign_types is
  port (
    ia_i : in  integer range -100 to 100;
    ra_i : in  real range -10.0 to 10.0;
    ta_i : in  time;
    io_o : out integer;
    ro_o : out real;
    to_o : out time
  );
end entity ent_sem_sign_types;

architecture rtl of ent_sem_sign_types is
begin
  io_o <= -ia_i;
  ro_o <= +ra_i;
  to_o <= -ta_i;
end architecture rtl;
