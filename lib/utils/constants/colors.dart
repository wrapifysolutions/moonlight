import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─── Brand / Primary ───────────────────────────────────────────────────────
  static const Color primary      = Color(0xFF7B61FF); // button gradient start
  static const Color primaryLight = Color(0xFFC084FC); // button gradient end / accent
  static const Color primaryDark  = Color(0xFF4A2FD9); // deeper purple

  // ─── Dark Theme ────────────────────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF0A0015); // deep space black-purple
  static const Color darkSurface    = Color(0xFF12002A); // card / bottom sheet surface
  static const Color darkOverlay    = Color(0x80000000); // rgba(0,0,0,0.5) over globe
  static const Color darkOnSurface  = Color(0xFFCCC9D9); // secondary text
  static const Color darkOnPrimary  = Color(0xFFFFFFFF); // text on buttons

  // ─── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFFFFFFF); // headings
  static const Color textSecondary = Color(0xFFCCC9D9); // subtitles / body
  static const Color textAccent    = Color(0xFFC084FC); // links e.g. "Login"
  static const Color textMuted     = Color(0xFF8B7FBB); // placeholders / disabled

  // ─── Semantic ──────────────────────────────────────────────────────────────
  static const Color error   = Color(0xFFE53935);
  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFF9A825);

  // ─── Gradients ─────────────────────────────────────────────────────────────
  static const Color gradientStart = Color(0xFF7B61FF); // same as primary
  static const Color gradientEnd   = Color(0xFFC084FC); // same as primaryLight

  // ─── Journey Log ───────────────────────────────────────────────────────────
  static const Color milestoneIconInactive = Color(0xFF0F172A);
  static const Color milestoneTitle        = Color(0xFFF1F5F9);
  static const Color milestoneSubtitle     = Color(0xFF94A3B8);
  static const Color journeyCloseButtonFill = Color(0x1AFFFFFF);
  static const Color journeyFooterText     = Color(0x80FFFFFF);
  static const Color journeyTimelineTrack  = Color(0x267B61FF);
  static const Color journeyTimelineFillStart = Color(0xCC7B61FF);
  static const Color journeyTimelineFillEnd   = Color(0x80C084FC);
}