-- =============================================================
-- Case ID: TC_SIGN_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Positive
-- Test Focus: Both signs + and - used in the same architecture — + for the identity path and - for the negation path, each sign used in its own concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_both_signs is
  port (
    val_i : in  integer range -64 to 63;
    pos_o : out integer range -64 to 63;
    neg_o : out integer range -63 to 64
  );
end entity ent_both_signs;

architecture rtl of ent_both_signs is
begin
  pos_o <= +val_i;
  neg_o <= -val_i;
end architecture rtl;
