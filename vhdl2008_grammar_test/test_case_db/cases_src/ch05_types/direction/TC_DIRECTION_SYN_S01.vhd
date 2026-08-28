-- =============================================================
-- Case ID: TC_DIRECTION_SYN_S01
-- Rule Type: Syntax (Production-Specific)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Production-specific test isolating "to" vs "downto" in
--   minimal type-definition contexts. Declares two identical-width
--   integer types differing only in direction keyword, then uses
--   both to exercise the direction distinction in subtype bounds.
-- Expected Result: Compiles; output is sum of both type values
-- Dependencies: None
-- =============================================================
entity direction_keyword_compare is
  port (
    a_val : in  integer range 0 to 255;
    b_val : in  integer range 255 downto 0;
    sum   : out integer
  );
end entity direction_keyword_compare;

architecture isolate_direction of direction_keyword_compare is
  type t_asc  is range 0 to 255;
  type t_desc is range 255 downto 0;
  signal sa : t_asc  := 1;
  signal sb : t_desc := 254;
begin
  sa <= t_asc(a_val);
  sb <= t_desc(b_val);
  sum <= integer(sa) + integer(sb);
end architecture isolate_direction;
