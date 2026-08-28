-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: the four magnitude comparison operators < <= > >= applied to integer range detection——the input value is compared with the lower and upper bounds to produce the in-range signal, verifying the use of four-way relational comparisons in combinational logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_range_check is
  port (
    val_i   : in  integer range 0 to 255;
    lo_i    : in  integer range 0 to 255;
    hi_i    : in  integer range 0 to 255;
    inrange_o : out boolean;
    below_o   : out boolean;
    above_o   : out boolean
  );
end entity ent_range_check;

architecture rtl of ent_range_check is
begin
  inrange_o <= (val_i >= lo_i) and (val_i <= hi_i);
  below_o   <= val_i < lo_i;
  above_o   <= val_i > hi_i;
end architecture rtl;
